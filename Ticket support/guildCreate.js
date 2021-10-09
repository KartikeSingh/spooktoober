//LOG WHEN YOUR BOT JOINS A SERVER INTO A CHANNEL 

client.on('guildCreate', guild =>{

  const channelId = '891364005640290328'; //put your channel ID here

  const channel = client.channels.cache.get(channelId); 

   //This Gets The Guild Owner

  if(!channel) return; //If the channel is invalid it returns

  const embed10 = new MessageEmbed()

      .setDescription(`joined **${guild.name}** (**${guild.memberCount}** members) \n akame is now in **${client.guilds.cache.size}** guilds`)

      .setColor('#FFFFFF')

      .setFooter(`ID: ${guild.id}`);

      channel.send({ embeds: [embed10]});

});

client.on('guildDelete', guild =>{

  const channelId = '891364005640290328';//add your channel ID

  const channel = client.channels.cache.get(channelId); //This Gets That Channel

  

  if(!channel) return;  //If the channel is invalid it returns

  const embed11 = new MessageEmbed()

     .setDescription(`left **${guild.name}** (**${guild.memberCount}** members) \n akame is now in **${client.guilds.cache.size}** guilds`)

      .setFooter(`ID: ${guild.id}`)

      .setColor('#FFFFFF')

      channel.send({ embeds: [embed11]});

});

MAKE YOUR BOT RESPOND TO MENTIONS 

client.on("messageCreate", message => {

    if (message.author.bot) return false;

    if (message.content.includes("@here") || message.content.includes("@everyone")) return false;

    if (message.mentions.has(client.user.id)) {

      const embed = new MessageEmbed()

      .setColor('#FFFFFF')

         .setTitle('akame')

         .setDescription('prefix for this server: `*`')

         .setFooter('akame', 'https://images-ext-2.discordapp.net/external/aisnEzL5f1Bc7Hra6p4cRzrgwngthfKysawofb1i57M/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/890999674423636038/50410eeb56254b4047adb3787bdaaf5f.webp?width=406&height=406')

      message.channel.send({

        embeds: [embed]

      })

    };

});

