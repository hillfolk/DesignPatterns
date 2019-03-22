package abstract_factory

type VehicleFactory interface {
	NewVeicle(v int) (Vehicle, error)
}


const (
	LuxuryCarType = 1
	FamilyCarType = 2
)


type CarFactory struct{}
func (c *CarFactory) NewVehicle(v int) (Vehicle, error){
	switch v {
	case LuxuryCarType:
		return new(LuxuryCar), nil
	case FamilyCarType:
		return new(FamilyCar), nil
	default:
		return nil,
		errors.New(fmt.Sprintf("Vehicle of type %d not recognized\n", v))
		
	}
}
