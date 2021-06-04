properties([
  buildDiscarder(logRotator(artifactNumToKeepStr: '10')),
  disableConcurrentBuilds() //disableds parallel builds
])

node{
  try{
    stage('Checkout') {
      checkout scm
      sh "git clean -fXd"
      sh "git clone https://github.com/metaborg/spt.git"
    }

    stage('Build SPT Runner') {
      withMaven(
        mavenLocalRepo: ".repository",
        mavenOpts: '-Xmx4G -Xms4G -Xss64m'
      ){
        sh "cd spt/org.metaborg.spt.cmd"
        sh "mvn package"
        sh "ls target/org.metaborg.spt.cmd*"
        sh "cd ../../"
      }
    }

    stage('Build SPT Language') {
      withMaven(
        mavenLocalRepo: ".repository",
        mavenOpts: '-Xmx4G -Xms4G -Xss64m'
      ){
        sh "cd spt/org.metaborg.meta.lang.spt"
        sh "mvn clean verify"
        sh "cd ../../"
      }
    }

    stage('Build WebDSL-Statix') {
      withMaven(
        mavenLocalRepo: ".repository",
        mavenOpts: '-Xmx4G -Xms4G -Xss64m'
      ){
        sh "cd webdslstatix"
        sh "mvn clean verify"
        sh "cd ../"
      }
    }

    stage('Build and Test') {
      withMaven(
        mavenLocalRepo: ".repository",
        mavenOpts: '-Xmx4G -Xms4G -Xss64m'
      ){
        sh './run_spt_tests'
      }
    }

    stage('Archive') {
      archiveArtifacts(
        artifacts: 'result/',
        excludes: null,
        onlyIfSuccessful: false
      )
    }

    stage('Cleanup') {
      sh "rm -rf spt"
      sh "git clean -fXd"
    }

  } catch (e) {

    throw e

  }
}