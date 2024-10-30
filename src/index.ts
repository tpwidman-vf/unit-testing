export function getData(id: number): any {
    if (id < 0) {
      return { error: "Invalid ID" };
    }
    return { data: "Some important data" };
}