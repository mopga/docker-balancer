### How-to-run

To run this example with load balance you need:

1. build the image:
```
docker build -t exapmle_http .
```
2. run the builded image on random port:
```
docker run -P d exapmle_http
```

3. repeat step 2 as many times as you need.

4. curl or open your browser in %this_node_ip%:8888 to check the things work

