//go:build !linux

package device

import (
	"github.com/you-oops-dev/amneziawg-go/conn"
	"github.com/you-oops-dev/amneziawg-go/rwcancel"
)

func (device *Device) startRouteListener(bind conn.Bind) (*rwcancel.RWCancel, error) {
	return nil, nil
}
