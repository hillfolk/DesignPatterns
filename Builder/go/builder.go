package builder

// Builder 인터페이스 정의
type Builder interface {
	SetWheels(wheel int) Builder
	SetSeats(seat int) Builder
	SetStructure(structure string)Builder
	GetVehicle() VehicleProduct
}


type ManufactureingDirector struct {
	builder Builder
}


func (f *ManufactureingDirector) Construct(s string) {
	f.builder.SetSeats(3).SetStructure(s).SetWheels(4)
}

func (f *ManufactureingDirector) SetBuilder(b Builder){
	f.builder = b
}

type VehicleProduct struct {
	Wheels int
	Seats int
	Structure string
}


type CarBuilder struct {
	v VehicleProduct
}

func (c *CarBuilder) SetWheels(wheel int) Builder {
	c.v.Wheels = wheel
}

func (c *CarBuilder) SetSeats(seat int) Builder {
	c.v.Seats = seat
}


