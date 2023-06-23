const bcryptjs = require('bcryptjs');
const db = require('../database/models');
const { validationResult } = require('express-validator');
const {Op} = require('sequelize')

const mainController = {
  home: (req, res) => {
    db.Book.findAll({
      include: [{ association: 'authors' }]
    })
      .then((books) => {
        res.render('home', { books });
      })
      .catch((error) => console.log(error));
  },
  bookDetail: (req, res) => {
    // Implement look for details in the database
    db.Book.findByPk(req.params.id,{
      include: ['authors']})
    .then((book) => {
      res.render('bookDetail',{book});
    }).catch(error => console.log(error))
  },

  bookSearch: (req, res) => {
    res.render('search', { books: [] });
  },

  bookSearchResult: (req, res) => {
    const { title } = req.body;
    console.log(title);
  
    db.Book.findAll({
      include: ['authors'],
      where: {
        title: { [Op.substring]: title }
      }
    })
      .then(books => {
        if (books.length === 0) {
          res.render('noResults');
        } else {
          res.render('search', { books });
        }
      })
      .catch(error => {
        console.log(error);
      });
  },
  

  deleteBook: (req, res) => {
    db.BooksAuthors.destroy({
      where : {
        BookId : req.params.id
      }
    }).then((response) => {
      if (response){
        db.Book.destroy({
          where : {
            id: req.params.id
          },
          force : true
          
        }).then(() => res.redirect('/'))
      }
   
    }).catch(error => console.log(error))

  },

  authors: (req, res) => {
    db.Author.findAll()
      .then((authors) => {
        res.render('authors', { authors });
      })
      .catch((error) => console.log(error));
  },

  authorBooks: async (req, res) => {
    // Implement books by author
    let authorBooks = await db.Book.findAll({
      include: [{
        association:'authors',
        where: {id: req.params.id}
      }],
      raw: true,
      nest: true,     
      }         
   ) 
  if(authorBooks){
    res.render('authorBooks',{books:authorBooks})
  }else{
    res.send('The author was not found.');
  }
},

  register: (req, res) => {
    res.render('register');
  },

  processRegister: async (req, res) => {
    const resultValidation = validationResult(req);   
  let emailExisting = await db.User.findOne({ where: { email: req.body.email } });
  
  if (resultValidation.errors.length > 0) {
      return res.render('register', {
          errors: resultValidation.mapped(),
          oldData: req.body
      })}  else if (emailExisting){
      return res.render('register', {
          errors: {
              email: {
                  msg: 'This email is already registered'
              },
          },
          oldData: req.body
          
      })} else {  
    db.User.create({
      Name: req.body.name,
      Email: req.body.email,
      Country: req.body.country,
      Pass: bcryptjs.hashSync(req.body.password, 10),
      CategoryId: req.body.category
    })
      .then(() => {
        res.redirect('/users/login');
      })
      .catch((error) => console.log(error));
  }},

  login: (req, res) => {
    // Implement login process
    res.render('login');
  },

  processLogin: async (req, res) => {
    // Implement login process
    let userToLogin = await db.User.findOne({ where: { Email: req.body.email } });
    
    if (userToLogin) {
        let isOkThePassword = bcryptjs.compareSync(req.body.password, userToLogin.Pass);
        if (isOkThePassword) {
            userToLogin.Pass = null;
            req.session.userLogged = userToLogin;
            if (req.body.remember_user) {
                res.cookie('userEmail', req.body.email, { maxAge: (1000 * 60) * 1})
            }
            return res.redirect('/users/profile');
        }else{
            return res.render('login', {
            errors: {
                password: {
                    msg: 'Contraseña incorrecta'
                }
              }

        });
    }} else{

    return res.render('login', {
        errors: {
            Email: {
                msg: 'No se encuentra el email'
            }
        }
    });
}},

  logout: (req, res) =>{
  res.clearCookie('userEmail')
  req.session.destroy();
  return res.redirect('/')
  },

  profile: async (req, res) =>{
  let msg = ""
  return res.render('profile',{user : req.session.userLogged,msg:msg})
  },

  edit: async (req, res) => {
    // Implement edit book
    let bookToEdit= await db.Book.findByPk (req.params.id,{
      include: [{association:'authors'}],
      raw: true,
      nest: true      
      })
    if(bookToEdit){
      res.render('editBook', {book:bookToEdit})
    }else{
      res.send('The book was not found.');
    }  
    },

  processEdit: async (req, res) => {
    // Implement edit book
    let bookToEditP = await db.Book.findByPk(req.params.id, {
      include: [{association: "authors"}]
  })
  let books = db.Book.findAll({
    include: [{ association: 'authors' }]
  })
  if(bookToEditP){
    db.Book.update({
      title: req.body.title,
      description: req.body.description,
      cover: req.body.cover,
      }, {where: {id: req.params.id}})  
      return  res.redirect('/');   
  }else {
  res.send('no se encontró el libro')
  } 
  }
};

module.exports = mainController;
