// See README.md for license details.

scalaVersion := "2.12.13"

val chiselVersion = "3.5.0"

lazy val root = (project in file("."))
  .settings(
    name := "%NAME%",
    libraryDependencies ++= Seq(
      "edu.berkeley.cs" %% "chisel3" % chiselVersion,
      "edu.berkeley.cs" %% "chisel-iotesters" % "1.5.0",
      "edu.berkeley.cs" %% "chiseltest" % "0.5.0" % "test",
      "org.scalatest"   %% "scalatest"  % "3.0.5" % "test",
      "edu.berkeley.cs" %% "chisel3" % "3.0-SNAPSHOT"
 
    ),
    scalacOptions ++= Seq(
      "-language:reflectiveCalls",
      "-deprecation",
      "-feature",
      "-Xcheckinit",

    ),

    resolvers ++= Seq(
      Resolver.sonatypeRepo("snapshots"),
      Resolver.sonatypeRepo("releases")
    ),

    addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % chiselVersion cross CrossVersion.full)
  )

