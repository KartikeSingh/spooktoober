const Commando = require("discord.js-commando");

const fetch = require("node-fetch");

var channel;

const apps = {

  "▶": {

    name: "YoutubeTogether",

    code: "755600276941176913",

    emoji: "▶"

  },

  "🃏": {

    name: "Poker Night",

    code: "755827207812677713",

    emoji: "🃏"

  },

  "🎣": {

    name: "Fishingtion.io",

    code: "814288819477020702",

    emoji: "🎣"

  },

  "♟": {

    name: "Chess in the Park",

    code: "832012774040141894",

    emoji: "♟"

  },

  "🗡": {

    name: "Betrayal.io",

    code: "773336526917861400",

    emoji: "🗡"

  }

};

var currentApp;

module.exports = class YoutubeTogether extends Commando.Command {

  constructor(client) {

    super(client, {

      name: "app",

      group: "discordapplications",

      aliases: ["ytt"],

      memberName: "apps",

      description: "Starts a Discord application"

    });

    client.on("messageReactionAdd", (reaction, user, message) => {

      if (user.bot) return;

      if (currentApp) return;

      const txtChannel = reaction.message.channel;

      currentApp = apps[reaction.emoji.name];

      fetch(`https://discord.com/api/v8/channels/${channel.id}/invites`, {

        method: "POST",

        body: JSON.stringify({

          max_age: 86400,

          max_uses: 0,

          target_application_id: currentApp.code,

          target_type: 2,

          temporary: false,

          validate: null

        }),

        headers: {

          Authorization: `Bot ${this.client.token}`,

          "Content-Type": "application/json"

        }

      })

        .then((res) => res.json())

        .then((invite) => {

          if (!invite.code || invite.errors)

            return message.channel.send(

              `Unable to start a ${currentApp.name} session`

            );

          txtChannel.send({

            embed: {

              title: currentApp.name,

              description: `To start a **${currentApp.name}** session. Press [here](https://discord.gg/${invite.code})`,

              color: "BLUE",

              footer: {

                text: "Discord is still testing applications,therefore application maybe prone to errors."

              }

            }

          });

        });

    });

  }

  async run(message, args) {

    currentApp = null;

    channel = message.member.voice.channel;

    if (!channel)

      return message.reply({

        embed: {

          description: "You have to be in a voice channel to use this",

          color: "RED"

        }

      });

    var description = "";

    var arr = Object.keys(apps).map((key) => {

      return apps[key];

    });

    arr.forEach((obj) => (description += `\n${obj.emoji}-${obj.name}\n`));

    message.channel

      .send({

        embed: {

          title: "React with emojis for desired app",

          description,

          color: "BLUE",

          footer: { text: "You can start only one session at a time" }

        }

      })

      .then((m) => {

        const emojis = Object.keys(apps);

        emojis.forEach((emoji) => m.react(emoji));

      });

  }

};

