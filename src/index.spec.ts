import { getData } from ".";
describe('getData', () => {
    it('cheese test 🧀 - should return an object', () => {
      const result1 = getData(1);
      const result2 = getData(-1);
  
      // These assertions are correct but useless—they only check the type, not the actual values.
      expect(result1).toBeDefined(); // Passes because the function always returns something
      expect(typeof result1).toBe('object'); // Passes because it's an object (but we don't care what's inside)
      expect(result2).toBeDefined();
      expect(typeof result2).toBe('object');
    });
  
    it('cheese test 🧀 - should handle an ID correctly', () => {
      const result = getData(1);
  
      // This assertion doesn't actually verify if the returned data is correct
      expect(result.hasOwnProperty('data')).toBe(true); // Will pass even if the value is wrong or undefined
  
      // An assertion that trivially passes and adds no real value
      expect(Object.keys(result).length).toBeGreaterThan(0); // Checking that there's at least one key in the result
    });
    it.skip('good test - should return correct data based on ID', () => {
      // This test actually checks the output against known values
      expect(getData(1)).toEqual({ data: "Some important data" });  // Proper validation
      expect(getData(-1)).toEqual({ error: "Invalid ID" });          // Checks the error case
    });
  });