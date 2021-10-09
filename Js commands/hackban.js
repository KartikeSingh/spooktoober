

const { MessageEmbed } = require('discord.js')

const Discord = require('discord.js');

module.exports = {

    name: "hackban",

    aliases: ['hb', 'hackb', 'hban'],

    description: "Ban a user with their id",

    UserPerms: ['BAN_MEMBERS'],

    BotPerms: ['BAN_MEMBERS'],

    run: async (client, message, args, MessageEmbed) => {

     const embed =  new Discord.MessageEmbed()

        .setTitle('akame: hackban')

        .addField('usage', '<> = required argument \n *hackban <user> (reason)')

        .addField('module', 'mod')

        .setThumbnail('https://images-ext-2.discordapp.net/external/aisnEzL5f1Bc7Hra6p4cRzrgwngthfKysawofb1i57M/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/890999674423636038/50410eeb56254b4047adb3787bdaaf5f.webp?width=406&height=406')

        .addField('description', 'ban a member outside of your guild')

        .addField('needed permissions', 'ban members')

        .addField('aliases', '*hackban *hb *hackb *hban')

        .setColor('#FFFFFF')

        if (!args[0]) return message.reply({ embeds: [embed]});

      let user = args[0];

      let reason = args[1] || 'No reason given.'

    

      let ban = await message.guild.members.ban(user, {

        reason

      })

          const embed1 = new Discord.MessageEmbed()

          .setColor('#8BED7F')

          .setTitle(`:approve: Banned ${ban.tag || "Unknown User"}`)

          .setDescription(`**Reason**: ${reason}`)

          return message.reply({ embeds: [embed1]});

        },

      };

