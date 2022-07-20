import { expect } from "chai";
import { Contract, BigNumber, Signer } from "ethers";
import { parseEther } from "ethers/lib/utils";
import hre, { ethers } from "hardhat";


describe("Asad Token", function () {

  let signers: Signer[];

  let asadTokenInstance: Contract;



  before(async () => {
    signers = await ethers.getSigners();

    hre.tracer.nameTags[await signers[0].getAddress()] = "ADMIN";
    hre.tracer.nameTags[await signers[1].getAddress()] = "USER1";

    const AsadToken = await ethers.getContractFactory("AsadToken", signers[0]);

    asadTokenInstance = await AsadToken.deploy();
    hre.tracer.nameTags[asadTokenInstance.address] = "TEST-TOKEN";
  });

  it('Should set the right Owner', async function () {

    console.log(asadTokenInstance.functions)

    // await asadTokenInstance.safeMint(5,{value: parseEther("1")})
    await asadTokenInstance.safeMint(0,{value: parseEther("0.8")})
    await asadTokenInstance.safeMint(0,{value: parseEther("0.8")})
    await asadTokenInstance.safeMint(0,{value: parseEther("0.8")})
    await asadTokenInstance.safeMint(0,{value: parseEther("0.8")})
    // await asadTokenInstance.safeMint(0,{value: parseEther("1")})

    await expect( asadTokenInstance.safeMint(0,{value: parseEther("0.8")})).to.be.revertedWith("Can't Mint more")


    await asadTokenInstance.safeMint(1,{value: parseEther("0.5")})
    await asadTokenInstance.safeMint(1,{value: parseEther("0.5")})
    await asadTokenInstance.safeMint(1,{value: parseEther("0.5")})
    await asadTokenInstance.safeMint(1,{value: parseEther("0.5")})
    await expect( asadTokenInstance.safeMint(1,{value: parseEther("0.5")})).to.be.revertedWith("Can't Mint more")
    await expect( asadTokenInstance.safeMint(1,{value: parseEther("0.4")})).to.be.revertedWith("Don't have Ether")


    await asadTokenInstance.safeMint(2,{value: parseEther("0.3")})
    await asadTokenInstance.safeMint(2,{value: parseEther("0.3")})
    await asadTokenInstance.safeMint(2,{value: parseEther("0.3")})
    await asadTokenInstance.safeMint(2,{value: parseEther("0.3")})
    await expect( asadTokenInstance.safeMint(2,{value: parseEther("0.3")})).to.be.revertedWith("Can't Mint more")



    await asadTokenInstance.safeMint(3,{value: parseEther("0.2")})
    await asadTokenInstance.safeMint(3,{value: parseEther("0.2")})
    await asadTokenInstance.safeMint(3,{value: parseEther("0.2")})
    await asadTokenInstance.safeMint(3,{value: parseEther("0.2")})
    await expect( asadTokenInstance.safeMint(3,{value: parseEther("0.2")})).to.be.revertedWith("Can't Mint more")

    await expect( asadTokenInstance.safeMint(5,{value: parseEther("0.5")})).to.be.revertedWith("Id Not Exists")


    await asadTokenInstance.safeMint(4,{value: parseEther("0.15")})
    await asadTokenInstance.safeMint(4,{value: parseEther("0.15")})
    await asadTokenInstance.safeMint(4,{value: parseEther("0.15")})
    await asadTokenInstance.safeMint(4,{value: parseEther("0.15")})
    await expect( asadTokenInstance.safeMint(4,{value: parseEther("0.15")})).to.be.revertedWith("Can't Mint more")



  })


});