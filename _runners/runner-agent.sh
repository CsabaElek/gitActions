#!/bin/bash
runner_version="2.283.3"
artifact_runner="actions-runner-linux-x64-${runner_version}.tar.gz"

#Install runner agent
mkdir actions-runner && cd actions-runner
curl -o ${artifact_runner} -L https://github.com/actions/runner/releases/download/v${runner_version}/${artifact_runner}
tar xzf ./${artifact_runner}

exit 0