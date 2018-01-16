pipeline {
  agent {
    dockerfile true
  }
  libraries {
    lib('fxtest@1.10')
  }
  options {
    ansiColor('xterm')
    timestamps()
    timeout(time: 5, unit: 'MINUTES')
  }
  environment {
    PYTEST_PROCESSES = "${PYTEST_PROCESSES ?: "auto"}"
    PYTEST_ADDOPTS =
    "-n=${PYTEST_PROCESSES} " +
    "--color=yes"
  }
  stages {
    stage('Lint') {
      agent {
        dockerfile true
      }
      steps {
        sh "flake8"
      }
    }
    stage('Test') {
      agent {
        dockerfile true
      }
      steps {
        sh "pytest --env=${env.TEST_ENV} config-tests/"
      }
    }
  }
  post {
    failure {
      mail(
        body: "${BUILD_URL}",
        from: "firefox-test-engineering@mozilla.com",
        replyTo: "firefox-test-engineering@mozilla.com",
        subject: "Build failed in Jenkins: ${JOB_NAME} #${BUILD_NUMBER}",
        to: "chartjes@mozilla.com")
    }
    changed {
      ircNotification('#services-test')
    }
  }
}
