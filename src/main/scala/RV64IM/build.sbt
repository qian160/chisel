ThisBuild / scalaVersion     := "2.13.8"
ThisBuild / organization     := "%ORGANIZATION%"
val chiselVersion = "3.5.3"

lazy val root = (project in file("."))
  .settings(
    name := "%RV64IM%",
    libraryDependencies ++= Seq(
        "edu.berkeley.cs" %% "chisel3" % chiselVersion,
        "edu.berkeley.cs" %% "chisel-iotesters" % "2.5.3",
      	"edu.berkeley.cs" %% "firrtl" % "1.5.3"	,
      	"edu.berkeley.cs" %% "chiseltest" % "0.5.3",
      	"edu.berkeley.cs" %% "treadle" % "1.5.3"
//	"edu.berkeley.cs" %% "firrtl-interpreter" % "1.5.3",
//	"edu.berkeley.cs" %% "chisel3-core" % "3.5.3"	
//	"edu.berkeley.cs" %% "chisel3-plugin" % "3.5.3"

    ),
    scalacOptions ++= Seq(
      "-language:reflectiveCalls",
      "-deprecation",
      "-feature",
      "-Xcheckinit",
      "-P:chiselplugin:genBundleElements",
    ),
    addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % chiselVersion cross CrossVersion.full),
  )
