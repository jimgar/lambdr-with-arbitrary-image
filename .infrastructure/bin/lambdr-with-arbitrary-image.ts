#!/usr/bin/env node
import "source-map-support/register";
import * as cdk from "aws-cdk-lib";
import { LambdrWithArbitraryImageStack } from "../lib/lambdr-with-arbitrary-image-stack";

const app = new cdk.App();
new LambdrWithArbitraryImageStack(app, "LambdrWithArbitraryImageStack", {
  // Your account number goes in the env below
  env: { account: "111122223333", region: "eu-west-2" },
});
