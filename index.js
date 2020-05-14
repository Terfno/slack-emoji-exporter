const Slack = require("slack-node");
const request = require("request");
const fs = require("fs");
const dotenv = require("dotenv").config();

apiToken = process.env.apitoken;
slack = new Slack(apiToken);

slack.api("emoji.list", (err, response) => {
  for (key in response.emoji) {
    url = response.emoji[key];

    // ignore alias
    if (url.match(/alias/)) {
      continue;
    }

    // target
    extention = url.match(/\.[^\.]+$/);

    request
      .get(url)
      .on("response", (res) => {})
      .pipe(fs.createWriteStream("emojis/" + key + extention));
  }
});

console.log("exporting done.");
process.exit();
