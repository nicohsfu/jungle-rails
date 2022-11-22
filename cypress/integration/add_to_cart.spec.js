describe('add_to_cart.spec.js', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("should test that users can click the 'Add to Cart' button for a product on the home page and in doing so their cart increases by one", () => {
    cy.get(".btn").first().click()

    // Check if it now says "My Cart (1)"
    // cy.get(".nav-item end-0").should("have.length", 1)
    // cy.contains("My Cart").contains("1")
    cy.contains("My Cart").should("contain", 1)
  });

})
