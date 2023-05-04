const fastify = require('fastify')
const app = fastify({ logger: true })

/**
 * Vérifie que l'application fonctionne
 */
app.get('/status', async (req, res) => {
  return { works: true }
})

/**
 * Point d'entrée de l'application
*/
exports.app = async (req, res) => {
  await app.ready()
  app.server.emit('request', req, res)
}