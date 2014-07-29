module.exports = function(grunt) {
  grunt.initConfig({
    stylus: {
      compile: {
        files: {
          'docs/css/docs.css': 'docs/styl/docs.styl'
        }
      }
    }
  , jade: {
      compile: {
        files: {
          'docs/index.html': 'docs/jade/pages/base.jade'
        , 'docs/components.html': 'docs/jade/pages/components.jade'
        , 'docs/layouts.html': 'docs/jade/pages/layouts.jade'
        }
      }
    }
  , watch: {
      options: {
        livereload: true
      }
    , jade: {
        files: 'docs/jade/**/*.jade'
      , tasks: 'jade'
      }
    , stylus: {
        files: 'docs/styl/**/*.styl'
      , tasks: 'stylus'
      }
    }
  , connect: {
      pub: {
        options: {
          hostname: 'localhost'
        , port: 9000
        , base: './'
        , keepalive: true
        }
      }
  }
  })

  grunt.loadNpmTasks('grunt-contrib-jade')
  grunt.loadNpmTasks('grunt-contrib-stylus')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-copy')

  grunt.registerTask('default', ['stylus', 'jade'])
}
