describe('add_to_cart.spec.js', () => {
  beforeEach(() => {
    cy.visit('/')
  })
  it("should test that users can click the 'Add to Cart' button for a product on the home page and in doing so their cart increases by one", () => {
    cy.get(".btn").first().click()
    cy.contains("My Cart").should("contain", 1)
  });
})