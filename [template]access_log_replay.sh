# Get requests from log
awk '{print $7}' access.log > requests.log
# Put into httperf format
tr "\n" "\0" < requests.log > requests_httperf
# Replay
httperf --server <yourserver> --port 80 --wlog=n,requests_httperf --num-conns=10000
