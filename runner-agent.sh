git_repository=$REPOSITORY
git_user=$USER
git_auth=$TOKEN
runner_version="2.283.3"
runner_checksum="09aa49b96a8cbe75878dfcdc4f6d313e430d9f92b1f4625116b117a21caaba89"
artifact_runner="actions-runner-linux-x64-${runner_version}.tar.gz"

#Install runner agent
mkdir actions-runner && cd actions-runner
curl -o ${artifact_runner} -L https://github.com/actions/runner/releases/download/v${runner_version}/${artifact_runner}
tar xzf ./${artifact_runner}
#Obtain registration token
git_token=curl -u csabaelek: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 -X POST -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/CsabaElek/gitActions/actions/runners/registration-token | jq .token
# Configure runner agent
./config.sh --url $git_repository --token $git_token
sudo ./svc.sh install
sudo ./svc.sh start

exit 0