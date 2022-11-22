describe('product_details.spec.js', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("should bring you to the product details page", () => {
    cy.get("article").first().click()
  });
  
  it("should be on the product details page now", () => {
    cy.visit('/products/2')
    cy.get(".page-header").should("contain", "Evergreens » Scented Blade")
  });
  
})
