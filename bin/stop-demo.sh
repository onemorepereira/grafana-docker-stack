# If himond is running, lets make sure its killed with fire
# We do not want multiple processes running on the same host
if [[ ! -z $(ps -AF |grep "root" |grep "himond" |awk '{print $2}') ]]
then
  sudo kill $(ps -AF |grep "root" |grep "himond" |awk '{print $2}');
  sleep 10;
fi

# Tear down pre-existing stacks
docker-compose -f ../docker-compose.yml down;
