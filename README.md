# slack-emoji-exporter
A tool to download slack emojis at once. If you have Docker, it works.

## required
* Docker
* GNU Make

## Usage
### Prepare a Slack API Token
see: https://api.slack.com

### Write token to .env.
First, let's run the following command.
```sh
$ make set
```

Then, put the apitoken as a key in .env.
```.env
apitoken = "{{.slack-api-token}}"
```

### Build docker image.
Run the following command.
```sh
$ make ready
```

### Export all slack emojis!
The export is completed by executing the following command.
```sh
$ make go
```

## ref
* https://api.slack.com/methods/emoji.list
* https://qiita.com/ne-peer/items/cbdef4f02b1bb6103e51
