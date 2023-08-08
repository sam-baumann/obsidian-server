# Docker configuration for webDAV server
Intended for use with the Obsidian [remotely save](https://github.com/remotely-save/remotely-save) plugin, but this configuration should work with any webDAV client.

## Usage
1. Clone this repository
2. Ensure docker and docker-compose are installed
3. Create user(s) by running
``` bash
sudo htpasswd -c ./.htpasswd <username>
```
for each user you want to create. You can add more users later by omitting the `-c` flag.

4. Run `docker-compose up -d` to start the server

## Todos
- [x] Add SSL support
