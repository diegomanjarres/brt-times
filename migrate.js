var knex = require('knex')({
  client: 'pg',
  connection: 'postgresql://postgres@localhost:5433/brt_times',
});

knex.schema.createTable('spottings', function(table) {
  table.string('mac');
  table.string('manufacturer');
  table.string('place');
  table.integer('time');
  table.index('mac');
})
// .createTable('arrival_spottings', function(table) {
//   table.string('mac');
//   table.string('manufacturer');
//   table.dateTime('time');
//   table.index('mac');
// })
.then(console.log).catch(console.log)
