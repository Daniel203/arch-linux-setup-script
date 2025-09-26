# Install required packages
packages=(
    docker
)

./utils/install_helper.sh "${packages[@]}"

# Rootless docker
curl -fsSL https://get.docker.com/rootless | sh
