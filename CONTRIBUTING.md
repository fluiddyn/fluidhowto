# How to contribute to the Fluiddyn Howto book?

1. Clone [this repo](https://foss.heptapod.net/fluiddyn/fluidhowto) locally.

   - Login on https://foss.heptapod.net (It can be done with your Github account.)

   - Create a ssh key and add it here: https://foss.heptapod.net/-/user_settings/ssh_keys

   - Clone the repo with

     ```sh
     hg add ssh://hg@foss.heptapod.net/fluiddyn/fluidhowto
     ```

2. Install PDM for example as explained in
   [the documentation](https://fluiddyn.pages.heptapod.net/fluidhowto/setup-apps.html).

3. Build the doc locally with `make build`.

4. Modify the source files in the directory `book`. Check that it still compiles locally
   (`make build`).

5. Get developer rights on the repository
   ([create a short issue](https://foss.heptapod.net/fluiddyn/fluidhowto/-/issues/new))

6. Commit, push and create a merge request.

   ```sh
   hg pull
   hg up default
   hg topic topic-name-explaining-what-you-changed
   hg commit -m "A message explaining the changes"
   hg push
   ```
