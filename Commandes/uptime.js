const Discord = require("discord.js")
const { EmbedBuilder } = require("discord.js")


module.exports = {

    name: 'uptime',
    description: "Voir le temps que le bot est online",
    utilisation: "/uptime",
    permission: "Aucune",
    dm: false,
    category: "🛠️・Développement",


    async run(bot, message, args) {
        const days = Math.floor(bot.uptime / 86400000);
        const hours = Math.floor(bot.uptime / 3600000) % 24;
        const minutes = Math.floor(bot.uptime / 60000) % 60;
        const seconds = Math.floor(bot.uptime / 1000) % 60;


        let uptime = new EmbedBuilder()
            .setTitle(`__${bot.user.username} Uptime__`)
            .setColor(bot.color)
            .setTimestamp()
            .addFields(
                { name: "Uptime", value: `\`${days}\` Jour(s), \`${hours}\` Heure(s), \`${minutes}\` Minute(s), \`${seconds}\` Seconde(s).` }
            )

        message.reply({ embeds: [uptime] });
    }
}




