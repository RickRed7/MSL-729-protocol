const hre = require("hardhat");

async function main() {
  console.log("Deploying MSL-729 Core to GODSOURCEGLOBAL Framework...");

  const SpatialLedger = await hre.ethers.getContractFactory("SpatialLedger");
  const ledger = await SpatialLedger.deploy();

  await ledger.deployed();

  console.log("SpatialLedger deployed to:", ledger.address);
  console.log("Resolution: 729 Voxels | Logic: Deterministic"); //
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
    
