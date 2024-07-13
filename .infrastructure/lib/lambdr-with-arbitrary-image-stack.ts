import * as cdk from "aws-cdk-lib";
import { Construct } from "constructs";
import * as lambda from "aws-cdk-lib/aws-lambda";

export class LambdrWithArbitraryImageStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    this.createFlagsLambda();
  }

  createFlagsLambda(): lambda.IFunction {
    const flagsLambda = new lambda.DockerImageFunction(this, "flags", {
      functionName: "flags",
      code: lambda.DockerImageCode.fromImageAsset("../lambda/flags"),
      timeout: cdk.Duration.seconds(15),
    });

    return flagsLambda;
  }
}
