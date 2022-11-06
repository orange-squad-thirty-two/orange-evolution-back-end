const ClassesService = require('../services/Classes.service');

const create = async (req, res) => {
  const { id } = req.params;

  const classes = await ClassesService.create(id, req.body);
  return res.status(201).json(classes);
};

const findAll = async (req, res) => {
  const classesAll = await ClassesService.findAll();
  return res.status(200).json(classesAll);
};

const detailClasses = async (req, res) => {
  const { curso_id } = req.params;

  const classes = await ClassesService.detailClasses(curso_id);
  return res.status(200).json(classes);
};

module.exports = { create, findAll, detailClasses };
