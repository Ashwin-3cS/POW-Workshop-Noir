// Simple Age Verification Circuit
// This circuit proves that someone is 18 or older without revealing their exact age
fn main(
    age: Field,           
    pub min_age: Field    
) {
    // In Noir, we use assert() to create constraints
    assert(age >= min_age); 
}


//  a more comprehensive example with additional features:
// Age Verification with Birth Year
// This version uses birth year and current year for more realistic scenarios
fn main_with_birth_year(
    birth_year: Field,        
    pub current_year: Field,  
    pub min_age: Field        
) {
    // Calculate the person's age
    let age = current_year - birth_year;
    
    assert(age >= min_age);
    
    assert(birth_year > 1900);
    assert(birth_year <= current_year);
}



// Example with Multiple Conditions
// This circuit demonstrates more complex logic
fn main_membership_eligibility(
    age: Field,                    // Private: person's age
    account_balance: Field,        // Private: bank account balance
    pub min_age: Field,           // Public: minimum age (18)
    pub min_balance: Field,       // Public: minimum balance (1000)
    pub is_eligible: bool         // Public: expected eligibility result
) {
    // Check if person meets age requirement
    let age_valid = age >= min_age;
    
    // Check if person meets balance requirement
    let balance_valid = account_balance >= min_balance;
    
    // Both conditions must be true for eligibility
    // In Noir, we can use boolean operations
    let actually_eligible = age_valid & balance_valid;
    
    // Verify that the calculated eligibility matches the expected result
    assert(actually_eligible == is_eligible);
}
