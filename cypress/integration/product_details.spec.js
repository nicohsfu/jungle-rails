describe('product_details.spec.js', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("should bring you to the product details page", () => {
    cy.get("article").first().click()
  });

})
