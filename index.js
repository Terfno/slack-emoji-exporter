const Slack = require("slack-node");
const request = require("request");
const fs = require("fs");
const dotenv = require("dotenv").config();
const apiToken = process.env.apitoken;

const getEmoji = () => {
  return new Promise((resolve) => {
    var slack = new Slack(apiToken);

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
      resolve("exporting " + Object.keys(response.emoji).length + " emojis");
    });
  });
};

getEmoji().then((res) => {
  console.log(res);
});
