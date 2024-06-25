# get root of repo
root_dir=$(git rev-parse --show-toplevel)
symlinks_dir=${root_dir}/.githooks
hooks_dir=${root_dir}/.git/hooks

echo "Symlinking pre-commit hook to ${symlinks_dir}/pre-commit"
ln -nsf ${symlinks_dir}/pre-commit ${hooks_dir}/pre-commit