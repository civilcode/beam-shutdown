# Umb

This is an umbrella containing 2 applications: A and B.

It's been created to check what happens when we send `SIGTERM` to the `BEAM`.

Here, we've setup application A, which depends on application B.

Both applications contains long running processes setup using GenServer.

We want to delay shutting down of the application A and give it time to clean up. To do that we
setup shutdown timeout, trap exit and setup `terminate` callback to be called on shutdown. Part of the
clean up step is to send message to application B.

Result: we successfully receive an answer.

To send `SIGTERM` signal:

```
ps ax | grep beam
kill -s TERM beam_pid
```
