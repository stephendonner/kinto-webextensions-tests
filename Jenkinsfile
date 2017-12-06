pipeline {
  agent any
  libraries {
    lib('fxtest@1.9')
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
    stage('Test') {
      steps {
        sh "${WORKSPACE}/run"
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
