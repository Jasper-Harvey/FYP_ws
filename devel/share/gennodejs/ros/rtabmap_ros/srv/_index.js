
"use strict";

let PublishMap = require('./PublishMap.js')
let GetNodesInRadius = require('./GetNodesInRadius.js')
let LoadDatabase = require('./LoadDatabase.js')
let ResetPose = require('./ResetPose.js')
let SetLabel = require('./SetLabel.js')
let GlobalBundleAdjustment = require('./GlobalBundleAdjustment.js')
let GetMap2 = require('./GetMap2.js')
let GetNodeData = require('./GetNodeData.js')
let GetPlan = require('./GetPlan.js')
let SetGoal = require('./SetGoal.js')
let ListLabels = require('./ListLabels.js')
let DetectMoreLoopClosures = require('./DetectMoreLoopClosures.js')
let AddLink = require('./AddLink.js')
let GetMap = require('./GetMap.js')
let CleanupLocalGrids = require('./CleanupLocalGrids.js')
let RemoveLabel = require('./RemoveLabel.js')

module.exports = {
  PublishMap: PublishMap,
  GetNodesInRadius: GetNodesInRadius,
  LoadDatabase: LoadDatabase,
  ResetPose: ResetPose,
  SetLabel: SetLabel,
  GlobalBundleAdjustment: GlobalBundleAdjustment,
  GetMap2: GetMap2,
  GetNodeData: GetNodeData,
  GetPlan: GetPlan,
  SetGoal: SetGoal,
  ListLabels: ListLabels,
  DetectMoreLoopClosures: DetectMoreLoopClosures,
  AddLink: AddLink,
  GetMap: GetMap,
  CleanupLocalGrids: CleanupLocalGrids,
  RemoveLabel: RemoveLabel,
};
