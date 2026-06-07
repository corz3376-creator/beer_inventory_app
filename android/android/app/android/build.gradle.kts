allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    afterEvaluate {
        if (hasProperty("android")) {
            val androidExtension = extensions.getByType(com.android.build.gradle.BaseExtension::class.java)
            androidExtension.compileSdkVersion(34)
        }
    }
}

tasks.withType<AbstractArchiveTask>().configureEach {
    isPreserveFileTimestamps = false
    isReproducibleFileOrder = true
}
