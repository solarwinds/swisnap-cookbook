#!/bin/bash


rb_snap='snap-ruby-client'
rackup_pid='/tmp/rackup.pid'

cleanup() {
    if [ -f "${rackup_pid}" ]; then
        kill "$(cat "${rackup_pid}")"
        rm "${rackup_pid}"
    fi

    rm -rf ./"${rb_snap}" geminabox
}

trap cleanup EXIT INT

eval "$(chef shell-init bash)"

build_ruby_snap() (
    git clone "git@github.com:librato/${rb_snap}.git"
    cd "${rb_snap}" || { echo "${rb_snap} doesn't exist"; exit 1; }
    gem build ruby_snap.gemspec
)

setup_geminabox() {
    gem install geminabox

    mkdir -p geminabox/data

    (
        cd geminabox

        cat > config.ru <<- EOF
            require "rubygems"
            require "geminabox"

            Geminabox.data = "./data"
            Geminabox.rubygems_proxy = true
            run Geminabox::Server
EOF

        RUBYGEMS_PROXY=true rackup --port 9292 &
        echo $! > "${rackup_pid}"
    )
    gem inabox "${rb_snap}"/ruby_snap-*.gem
}

test_vagrant() {
    gem install kitchen-vagrant
    KITCHEN_YAML="kitchen-vagrant.yaml" kitchen test
}

test_travis() {
    gem install kitchen-local
    KITCHEN_YAML="kitchen-travis.yaml" kitchen test
}

main() {
    build_ruby_snap
    setup_geminabox
    if [[ "${TRAVIS}" == true ]]; then
        test_travis
    else
        test_vagrant
    fi
}

main
