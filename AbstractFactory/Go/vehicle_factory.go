package abstract_factory

type VehicleFactory interface {
	NewVeicle(v int) (Vehicle, error)
}


const (
	LuxuryCarType = 1
	FamilyCarType =2
)


type CarFactory struct{}
func (c *CarFactory) NewVehicle(v int) (Vehicle, error){
	
}
