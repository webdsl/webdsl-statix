properties([
  buildDiscarder(logRotator(artifactNumToKeepStr: '10')),
  disableConcurrentBuilds() //disableds parallel builds
])

node{
  try{
    stage('Checkout') {
      checkout scm
      sh '''
         git clean -fXd
         git clone https://github.com/metaborg/spt.git
         git clone https://github.com/metaborg/spoofax-sunshine.git
         '''
    }

    stage('Build SPT Runner') {
      withMaven(
        mavenLocalRepo: ".repository",
        mavenOpts: '-Xmx4G -Xms4G -Xss64m'
      ) {
        sh '''
           cd spt/org.metaborg.spt.cmd
           mvn package
           ls target/org.metaborg.spt.cmd*
           cd ../../
           '''
      }
    }

    stage('Build SPT Language') {
      withMaven(
        mavenLocalRepo: ".repository",
        mavenOpts: '-Xmx4G -Xms4G -Xss64m'
      ) {
        sh '''
           cd spt/org.metaborg.meta.lang.spt
           mvn clean verify
           cd ../../
           '''
      }
    }

    stage('Build Spoofax Sunshine') {
      withMaven(
        mavenLocalRepo: ".repository",
        mavenOpts: '-Xmx4G -Xms4G -Xss64m'
      ) {
        sh '''
           cd spoofax-sunshine/org.metaborg.sunshine2
           mvn package
           ls target/org.metaborg.sunshine2*
           cd ../../
           '''
      }
    }

    stage('Build WebDSL-Statix') {
      withMaven(
        mavenLocalRepo: ".repository",
        mavenOpts: '-Xmx4G -Xms4G -Xss64m'
      ) {
        sh '''
           cd webdslstatix
           mvn clean verify
           cd ../
           '''
      }
    }

    stage('Run SPT Tests (Syntax)') {
      withMaven(
        mavenLocalRepo: ".repository",
        mavenOpts: '-Xmx4G -Xms4G -Xss64m'
      ) {
        sh '''
           ./run_spt_tests
           '''
      }
    }

    stage('Run Analysis Tests') {
      withMaven(
        mavenLocalRepo: ".repository",
        mavenOpts: '-Xmx4G -Xms4G -Xss64m'
      ) {
        sh '''
           ./run_analysis_tests
           '''
      }
    }

    stage('Run End-To-End Tests') {
      withMaven(
        mavenLocalRepo: ".repository",
        mavenOpts: '-Xmx4G -Xms4G -Xss64m'
      ) {
        sh '''
            ./run_end_to_end_tests
          '''
      }
    }

    stage('Archive') {
      archiveArtifacts(
        artifacts: 'spt-results/ , e2e-results/, analysis-results/',
        excludes: null,
        onlyIfSuccessful: false
      )
    }

    stage('Cleanup') {
      sh '''
         rm -rf spt
         git clean -fXd
         '''
    }

  } catch (e) {

    throw e

  }
}