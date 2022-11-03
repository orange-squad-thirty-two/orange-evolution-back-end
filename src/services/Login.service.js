const knex = require('../connections/database');
const bcrypt = require('bcrypt');
const { generationToken } = require('../auth/auth');
const errors = require('../utils/errorsBase');

const signIn = async (data) => {
  const { email, password } = data;
  const user = await knex('users').where('email', email).first();

  if (!user) {
    throw errors(403, 'E-mail ou senha incorretos!');
  }

  const encrypted = await bcrypt.compare(password, user.password);
  if (!encrypted) {
    throw errors(403, 'E-mail ou senha incorretos!');
  }

  const payload = { id: user.id, name: user.name, email: user.email };
  token = generationToken(payload);

  return { token };
};

module.exports = {
  signIn,
};