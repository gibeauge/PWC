#!/bin/sh
#
# Arbortext Digital Media Consumer Setup Script
# Copyright 2005, all rights reserved
#
# Arbortext Digital Media Consumer Executable
# Copyright 2005, all rights reserved
#
#
#
# OS specific support.  $var _must_ be set to either true or false.
platform=hpux


case "`uname -a`" in
Linux*) platform=linux;;
HP-UX*) platform=hpux;;
SunOS*sparc*) platform=solaris;;
SunOS*i86pc*) platform=solaris_x86;;
Solaris*sparc*) platform=solaris;;
esac

# echo $platform

# resolve links - $0 may be a softlink
PRG="$0"

while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '.*/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

# Get standard environment variables
PRGDIR=`dirname "$PRG"`

#echo $PRGDIR

# The environment variable $0 contains the path and name of this script.
# Get the directory of the current script with "dirname"
BUNDLED_JAVA_PATH=$PRGDIR/jre/$platform/jre/bin/java

JAVA_PATH=0

JAVA_RUNTIME_OK="false"

if [ -x "$BUNDLED_JAVA_PATH" ]
then
    JAVA_PATH=$BUNDLED_JAVA_PATH
    JAVA_RUNTIME_OK="true"
else

# if not exist, warning and look for installed

# test if there is an Java-Runtime
    echo "Looking for Java Runtime 1.4 ..."


# test strings
#JAVA_VERSION_OUTPUT="java version \"1.3.1\""
#JAVA_VERSION_OUTPUT="java version \"1.5.1\""
#JAVA_VERSION_OUTPUT="java version \"2.5.1\""

# put the output of the command "java -version" into an environment variable
    JAVA_VERSION_OUTPUT=`java -version 2>&1 | grep "java version"`
    if [ $? -eq 0 ]
    then
  # the Java-Runtime does exist
  # verify the version of the runtime
  # the environment variable ${JAVA_VERSION_OUTPUT} contains a string 
  # like: java version "1.4.1"
  # the next step is to get the version number from the string
    echo "${JAVA_VERSION_OUTPUT}"
  
  # remove "java version " from the string
    JAVA_VERSION=`echo ${JAVA_VERSION_OUTPUT} | sed 's/java version //'`
  # now the environment variable contains "1.4.2"
  # remove the quotation marks
    JAVA_VERSION=`echo ${JAVA_VERSION} | sed 's/\"//g'`
  # now the environment variable containts 1.4.2 (without the quotations marks)
  
  # get the first digit of the java version: 1
    JAVA_VERSION1=`echo ${JAVA_VERSION} | cut -f 1 -d .`
    JAVA_VERSION2=`echo ${JAVA_VERSION} | cut -f 2 -d .`
    JAVA_VERSION3=`echo ${JAVA_VERSION} | cut -f 3 -d . | cut -f 1 -d _`
  
    if [ "${JAVA_VERSION1}" != "" ] && [ "${JAVA_VERSION2}" != "" ]
    then
    # the java version is not null
	if [ ${JAVA_VERSION1} -eq 1 ]
	then
      # ok the first part of the java version is correct
      
    if [ ${JAVA_VERSION2} -gt 4 ]  
    then
    	# > 4 ok the second part of the java version fulfil the minimum requirements
	    echo "The Java-Version is correct."
	    JAVA_RUNTIME_OK="true"
    else
	if [ ${JAVA_VERSION2} -eq 4 ]
	then
		if [ ${JAVA_VERSION3} != '' ] && [ ${JAVA_VERSION3} -ge 2 ]
		then
        # ok the second part of the java version fulfil the minimum requirements
	    echo "The Java-Version is correct."
	    JAVA_RUNTIME_OK="true"
	    else
	    	  # the minimum requirements are not fulfilled
	    	  echo "Warning: The Java-Version does not fulfill the minimum requirements."
	          echo "         The %projectName% application will not start."
	    fi
	else
	    if [ ${JAVA_VERSION2} -lt 4 ]
	    then
	  # the minimum requirements are not fulfilled
	    echo "Warning: The Java-Version does not fulfill the minimum requirements."
	    echo "         The %projectName% application will not start."
	    else
	    JAVA_RUNTIME_OK="true"
	    fi
	fi
	fi
	else 
	echo "Warning: Wrong Major Release: ${JAVA_VERSION1}"
	fi
    else
	echo "Warning: Cannot detect the Java-Runtime Version."
    fi
  
    else
    echo "Error: Cannot find the Java-Runtime: \"java\""
    fi

#echo $JAVA_RUNTIME_OK
    if [ ${JAVA_RUNTIME_OK} = "true" ]
    then
	JAVA_PATH=java
    fi

fi

#echo $JAVA_PATH

#echo $JAVA_RUNTIME_OK

if [ ${JAVA_RUNTIME_OK} = "false" ]
then
	if [ -d "$PRGDIR/jre/$platform/installer" ]
		then
			echo "No suitable Java-Runtime installed. Please install Java runtime environment located at $PRGDIR/jre/$platform/installer and try to run the program again."
    		exit $?
		else
		    echo "No suitable Java-Runtime found. %projectName% will exit."
    		exit $?
	fi	
else
    #echo $JAVA_PATH $PRGDIR/setup.jar
    cd "$PRGDIR"
    exec "$JAVA_PATH" -jar "setup.jar" $* > /dev/null 2>&1 < /dev/null
    
exit $?
fi

