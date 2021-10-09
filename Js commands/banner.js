//Get Banner of a User

const { Message, Client, MessageEmbed } = require("discord.js");

module.exports = {

  name: "avatar",

  aliases: ["av", "pfp", "dp"],

  permissions: [""],

  /**

   *

   * @param {Client} client

   * @param {Message} message

   * @param {String[]} args

   */

  run: async (client, message, args) => {

    let user = message.mentions.users.first() || message.author;

    user = await user.fetch();

    if (user.banner) {

      message.channel.send({

        embeds: [

          new MessageEmbed()

            .setImage(user.bannerURL({ size: 4096, dynamic: true }))

            .setTitle(`Banner From ${user.tag}`),

        ],

      });

    } else {

      console.log(`No Banner`);

    }

  },

};

