#!/usr/bin/env bash
java -jar agent.jar -jnlpUrl $JENKINS_URL/computer/$JENKINS_AGENT_NAME/slave-agent.jnlp -secret $JENKINS_SECRET -workDir "$JENKINS_AGENT_WORKDIR"
