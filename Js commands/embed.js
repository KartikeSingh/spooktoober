

const { Message, Client, MessageEmbed } = require("discord.js");

module.exports = {

  name: "embed",

  description: " ",

  aliases: [""],

  permissions: [""],

  /**

   *

   * @param {Client} client

   * @param {Message} message

   * @param {String[]} args

   */

  run: async (client, message, args, prefix) => {

    let title;

    let desc;

    let footer;

    let filter = (i) => i.author.id === message.author.id;

    await message.channel.send(`What is Embed Tittle ?`).then(async (msg) => {

      try {

        await msg.channel

          .awaitMessages({ filter: filter, max: 1 })

          .then(async (val) => {

            title = val.first().content;

          });

      } catch (e) {}

    });

    await message.channel

      .send(`What is Embed Description ?`)

      .then(async (msg) => {

        try {

          await msg.channel

            .awaitMessages({ filter: filter, max: 1 })

            .then(async (val) => {

              desc = val.first().content;

            });

        } catch (e) {}

      });

    await message.channel.send(`What is Embed Footer ?`).then(async (msg) => {

      try {

        await msg.channel

          .awaitMessages({ filter: filter, max: 1 })

          .then(async (val) => {

            footer = val.first().content;

          });

      } catch (e) {}

    });

    let embed = new MessageEmbed()

      .setTitle(title)

      .setDescription(desc)

      .setFooter(footer, message.author.displayAvatarURL({ dynamic: true }));

    message.channel.send({ embeds: [embed] });

  },

};

