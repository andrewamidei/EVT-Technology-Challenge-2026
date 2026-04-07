DIRECTORY="certs"

if [ ! -d "$DIRECTORY" ]; then
  echo "Creating $DIRECTORY directory"
  mkdir $DIRECTORY
fi

if ! [ "$(ls -A $DIRECTORY)" ]; then
    echo "Generating openssl keys"
    ./generate_keys.sh
fi

echo "Running Docker compose"
docker compose up -d
