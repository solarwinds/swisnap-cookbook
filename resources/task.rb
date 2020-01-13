resource_name :swisnap_task
property :task_manifest, String
property :task_id, String

action :create do
  unless similar_task_running?
    resp = tasks_client.load(parsed_task_manifest)
    if resp.success?
      if resp.value_or(nil)
        tasks_client.put("#{resp.value_or(nil)[:body][:id]}/start")
      end
    else
      Chef::Log.fatal("Error while creating task: #{resp}")
      raise
    end
  end
end

action :start do
  tasks_client.put("#{new_resource.task_id}/start")
end

action :stop do
  require 'timeout'
  Timeout.timeout(60) do
    until stopped?
      tasks_client.put("#{new_resource.task_id}/stop")
      sleep(1)
    end
  end
end

action :remove do
  action_stop
  tasks_client.delete(new_resource.task_id)
end

action_class.class_eval do
  def tasks_client
    require 'ruby_snap'
    RubySnap::TasksClient.new
  end

  def stopped?
    resp = tasks_client.get(new_resource.task_id)
                       .value_or(nil)
    resp ? resp[:body][:task_state] == 'Stopped' : true
  end

  def parsed_task_manifest
    YAML.load_file(new_resource.task_manifest)
  end

  def provided_metrics
    parsed_task_manifest['workflow']['collect']['metrics'].keys.sort
  end

  def scheduled_tasks
    tasks = tasks_client.get.value_or(nil)
    return [] unless tasks
    tasks = tasks[:body][:ScheduledTasks]
    ids = []
    tasks.each do |t|
      t.each do |k, v|
        ids << v if k == :id
      end
    end
    ids
  end

  def similar_task_running?
    scheduled_tasks.each do |id|
      task_info = tasks_client.get(id).value_or(nil)
      return false unless task_info
      metrics = task_info[:body][:workflow][:collect][:metrics]
                .keys
                .sort
                .map(&:to_s)
                .compact
      return true if metrics == provided_metrics
    end
    false
  end
end
