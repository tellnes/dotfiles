var fs = require('fs')
var path = require('path')

// more popular packages should go here, maybe?
function isTestPkg (p) {
  return !!p.match(/^(expresso|mocha|tap|coffee-script|coco|streamline)$/)
}

function niceName (n) {
  return n.replace(/^node-|[.-]js$/g, '')
}

function readDeps (test) { return function (cb) {
  fs.readdir('node_modules', function (er, dir) {
    if (er) return cb(null, {})
    var deps = {}
    var n = dir.length
    if (n === 0) return cb(null, deps)
    dir.forEach(function (d) {
      if (d.match(/^\./)) return next()
      if (test !== isTestPkg(d))
        return next()

      var dp = path.join(dirname, 'node_modules', d, 'package.json')
      fs.readFile(dp, 'utf8', function (er, p) {
        if (er) return next()
        try { p = JSON.parse(p) }
        catch (e) { return next() }
        if (!p.version) return next()
        deps[d] = '~' + p.version
        return next()
      })
    })
    function next () {
      if (--n === 0) return cb(null, deps)
    }
  })
}}


exports.name = package.name || niceName(basename)
exports.version = package.version || '0.0.0'
exports.description = package.description || exports.name


if (!package.main) {
  exports.main = function (cb) {
    fs.readdir(dirname, function (er, f) {
      if (er) f = []

      f = f.filter(function (f) {
        return f.match(/\.js$/)
      })

      if (f.indexOf('index.js') !== -1)
        f = 'index.js'
      else if (f.indexOf('app.js') !== -1)
        f = 'app.js'
      else if (f.indexOf('main.js') !== -1)
        f = 'main.js'
      else if (f.indexOf(basename + '.js') !== -1)
        f = basename + '.js'
      else
        f = f[0]

      return cb(null, f || 'index.js')
    })
  }
}

if (!package.bin) {
  exports.bin = function (cb) {
    fs.readdir(path.resolve(dirname, 'bin'), function (er, d) {
      // no bins
      if (er) return cb()
      // just take the first js file we find there, or nada
      return cb(null, d.filter(function (f) {
        return f.match(/\.js$/)
      })[0])
    })
  }
}

if (!package.dependencies) {
  exports.dependencies = readDeps(false)
}

if (!package.devDependencies) {
  exports.devDependencies = readDeps(true)
}

exports.scripts = package.scripts || {}

if (!package.repository) {
  exports.repository = function (cb) {
    fs.readFile('.git/config', 'utf8', function (er, gconf) {
      if (er || !gconf) return cb(null, null)

      gconf = gconf.split(/\r?\n/)
      var i = gconf.indexOf('[remote "origin"]')
      if (i !== -1) {
        var u = gconf[i + 1]
        if (!u.match(/^\s*url =/)) u = gconf[i + 2]
        if (!u.match(/^\s*url =/)) u = null
        else u = u.replace(/^\s*url = /, '')
      }
      if (u && u.match(/^git@github.com:/))
        u = u.replace(/^git@github.com:/, 'git://github.com/')

      return cb(null, u)
    })
  }
}

exports.keywords = package.keywords || []

if (!package.author) {
  exports.author = {
    "name" : "Christian Tellnes",
    "email" : "christian@tellnes.no",
    "url" : "http://christian.tellnes.com"
  }
}

exports.license = package.license || 'MIT'
