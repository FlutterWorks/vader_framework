import Stripe from "stripe";
import express from "express";

const stripe = new Stripe("sk_test_51R0OCHHvX9q1UHhz9GW6yVajYwS1wjQOITUI0VOtn9iYRUNo0F6HwfzGt96CkIwPIbhNkAf5hnhIQ6Z7px2DHMe900Q9ATsZDu", {
    apiVersion: "2020-08-27"
})

const app = express();

app.get("/connectionToken", async (req, res) => {
    const token = await stripe.terminal.connectionTokens.create();
    res.send({
        success: true,
        data: token.secret
    });
});

app.listen(8000, () => {
    console.log("Server started")
});