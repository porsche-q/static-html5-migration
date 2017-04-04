// Created by Larry Ullman, www.larryullman.com, @LarryUllman
// Posted as part of the series "Processing Payments with Stripe"
// http://www.larryullman.com/series/processing-payments-with-stripe/
// Last updated February 20, 2013

// This page is intended to be stored in a public "js" directory.

// This function is just used to display error messages on the page.
// Assumes there's an element with an ID of "payment-errors".

// Assumes jQuery is loaded!
// Watch for the document to be ready:
//$(document).ready(function() {

jQuery(document).ready(function ($) {
      function onReceiveToken(token, args) {
        // Submit token to server so it can charge the card
        $.ajax({
            url: '/charge',
            type: 'POST',
            data: {
                stripeToken: token.id
            }
        });
    }

    // Configure Checkout
    var checkout = StripeCheckout.configure({
        key: 'pk_MY_PUBLISHABLE_KEY',
        token: onReceiveToken,

        image: 'http://nairteashop.org/wp-content/uploads/avatar.png',
        name: 'nairteashop.org',
        description: 'Send lots of love',
        amount: 1000,
        billingAddress: 'true'
    });

    // Open Checkout when the link is clicked
  //  $('#pay').on('click', function() {
	  $("#payment-form").submit(function(event) {
        checkout.open();
        return false;
    });
	
	
}); // Document ready.

